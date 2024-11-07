import { Controller, Get, Query } from '@nestjs/common';
import { InfringementService } from './services/Infringement.service';
import { UserQuery } from './model/user-query';

@Controller()
export class InfringementController {
  constructor(private readonly infringementService: InfringementService) {}

  @Get('infringement')
  findInfringement(@Query() query: UserQuery) {
    return this.infringementService.analyse(query.patentId, query.companyName);
  }
}
