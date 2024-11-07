import { Injectable } from '@nestjs/common';
import { GoogleAiService } from '../../../shared/services/google-ai.service';
import { CompanyRepository } from '../infra/repositories/company.repository';
import { PatentRepository } from '../infra/repositories/patent.repository';
import { InfringementAnalysis } from '../model/infringement-analysis';

@Injectable()
export class InfringementService {
  constructor(
    private readonly patentRepo: PatentRepository,
    private readonly companyRepo: CompanyRepository,
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
    const patent = this.patentRepo.findById(patentId);
    const company = this.companyRepo.findByName(companyName);

    const jsonData = await this.googleAiService.generateContent(
      this.patentPrompt +
        JSON.stringify(patent) +
        '\n\n' +
        this.companyPrompt +
        JSON.stringify(company),
      this.responseSchema,
    );

    return JSON.parse(jsonData) as InfringementAnalysis;
  }
}
