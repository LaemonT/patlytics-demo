import { Injectable } from '@nestjs/common';
import { InfringementAnalysis } from '../../model/infringement-analysis';

@Injectable()
export class AnalysisRepository {
  private analyses: InfringementAnalysis[] = [];

  saveAnalysis(analysis: InfringementAnalysis) {
    this.analyses.push(analysis);
  }

  searchAnalysis(patentId: string, companyName: string) {
    return this.analyses.find(
      (item) => item.patent_id === patentId && item.company_name == companyName,
    );
  }
}
