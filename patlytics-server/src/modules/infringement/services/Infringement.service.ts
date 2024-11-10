import { BadRequestException, Injectable } from '@nestjs/common';
import { GoogleAiService } from '../../../shared/services/google-ai.service';
import { CompanyRepository } from '../infra/repositories/company.repository';
import { PatentRepository } from '../infra/repositories/patent.repository';
import { InfringementAnalysis } from '../model/infringement-analysis';
import { AnalysisRepository } from '../infra/repositories/analysis.repository';

@Injectable()
export class InfringementService {
  constructor(
    private readonly patentRepo: PatentRepository,
    private readonly companyRepo: CompanyRepository,
    private readonly analysisRepo: AnalysisRepository,
    private readonly googleAiService: GoogleAiService,
  ) {}

  private readonly responseSchema = {
    type: 'object',
    properties: {
      analysis_id: {
        type: 'string',
      },
      patent_id: {
        type: 'string',
      },
      company_name: {
        type: 'string',
      },
      analysis_date: {
        type: 'string',
      },
      top_infringing_products: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            product_name: {
              type: 'string',
            },
            infringement_likelihood: {
              type: 'string',
            },
            relevant_claims: {
              type: 'array',
              items: {
                type: 'string',
              },
            },
            explanation: {
              type: 'string',
            },
            specific_features: {
              type: 'array',
              items: {
                type: 'string',
              },
            },
          },
          required: [
            'product_name',
            'infringement_likelihood',
            'relevant_claims',
            'explanation',
            'specific_features',
          ],
        },
      },
      overall_risk_assessment: {
        type: 'string',
      },
    },
    required: [
      'analysis_id',
      'patent_id',
      'company_name',
      'analysis_date',
      'top_infringing_products',
      'overall_risk_assessment',
    ],
  };

  private readonly patentPrompt = 'Given the following patent json object:\n';
  private readonly companyPrompt =
    "Please determine relevance and potential infringement for company's product as shown in the following json object, and return the top two infringing products of the company:";

  async analyse(patentId: string, companyName: string) {
    // Search for any existing analysis and return it immediately
    const existingAnalysis = this.analysisRepo.searchCachedResult(
      patentId,
      companyName,
    );
    if (existingAnalysis != undefined) {
      console.log('Existing cached analysis is returned!');
      return existingAnalysis;
    }

    // Find the matching patent
    const patent = this.patentRepo.findById(patentId);
    if (patent == null) {
      throw new BadRequestException('Patent ID does not exist');
    }

    // Find the matching company including their products
    const company = this.companyRepo.findByName(companyName);
    if (company == null) {
      throw new BadRequestException('Company not found');
    }

    // Generate content from an AI service
    const jsonData = await this.googleAiService.generateContent(
      this.patentPrompt +
        JSON.stringify(patent) +
        '\n\n' +
        this.companyPrompt +
        JSON.stringify(company),
      this.responseSchema,
    );
    console.log('New analysis is generated.');
    const analysis = JSON.parse(jsonData) as InfringementAnalysis;

    // Cache the result for later use to reduce frequent calls to the AI service
    this.analysisRepo.cacheResult(analysis);

    return analysis;
  }

  async savedAnalyses(userId: string) {
    return this.analysisRepo.readSavedAnalyses(userId);
  }

  async saveAnalysisResult(userId: string, analysis: InfringementAnalysis) {
    return this.analysisRepo.saveAnalysis(userId, analysis);
  }
}
