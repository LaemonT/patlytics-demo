import { Body, Controller, Get, Put, Query } from '@nestjs/common';
import { InfringementService } from './services/Infringement.service';
import { UserQuery } from './model/user-query';
import { InfringementAnalysis } from './model/infringement-analysis';

@Controller()
export class InfringementController {
  constructor(private readonly infringementService: InfringementService) {}

  @Get('infringement')
  findInfringement(@Query() query: UserQuery) {
    return this.infringementService.analyse(query.patentId, query.companyName);
  }

  @Get('analyses')
  findAnalyses(@Query() userId: string) {
    return this.infringementService.savedAnalyses(userId);
  }

  @Put('analyses')
  saveAnalysis(
    @Query() userId: string,
    @Body() analysis: InfringementAnalysis,
  ) {
    return this.infringementService.saveAnalysisResult(userId, analysis);
  }
}
