import { Injectable } from '@nestjs/common';
import { InfringementAnalysis } from '../../model/infringement-analysis';
import Fuse from 'fuse.js';

@Injectable()
export class AnalysisRepository {
  private cachedResult: InfringementAnalysis[] = [];
  private analysesCollection: { [key: string]: InfringementAnalysis[] } = {};

  cacheResult(analysis: InfringementAnalysis) {
    this.cachedResult.push(analysis);
  }

  searchCachedResult(patentId: string, companyName: string) {
    return this.cachedResult.find((item) => {
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

  readSavedAnalyses(userId: string) {
    return this.analysesCollection[userId] ?? [];
  }

  saveAnalysis(userId: string, analysis: InfringementAnalysis) {
    let savedAnalyses = this.analysesCollection[userId];
    if (savedAnalyses == undefined) {
      savedAnalyses = [analysis];
    } else {
      const alreadySaved = savedAnalyses.some(
        (a) => a.analysis_id == analysis.analysis_id,
      );
      if (!alreadySaved) {
        savedAnalyses.push(analysis);
      }
    }
    this.analysesCollection[userId] = savedAnalyses;
    return analysis;
  }
}
