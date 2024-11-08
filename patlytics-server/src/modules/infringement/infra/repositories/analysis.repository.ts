import { Injectable } from '@nestjs/common';
import { InfringementAnalysis } from '../../model/infringement-analysis';
import Fuse from 'fuse.js';

@Injectable()
export class AnalysisRepository {
  private analyses: InfringementAnalysis[] = [];

  saveAnalysis(analysis: InfringementAnalysis) {
    this.analyses.push(analysis);
  }

  searchAnalysis(patentId: string, companyName: string) {
    return this.analyses.find((item) => {
      // Use fuzzy search for the company name
      const fuse = new Fuse([item.company_name], {
        keys: ['name'],
        threshold: 0.2,
        shouldSort: true,
      });
      const result = fuse.search(companyName);
      if (result.length > 0) {
        return item.patent_id == patentId;
      } else {
        return false;
      }
    });
  }
}
