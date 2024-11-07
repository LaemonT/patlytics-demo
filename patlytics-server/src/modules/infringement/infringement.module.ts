import { Module } from '@nestjs/common';
import { InfringementController } from './infringement.controller';
import { InfringementService } from './services/Infringement.service';
import { PatentRepository } from './infra/repositories/patent.repository';
import { CompanyRepository } from './infra/repositories/company.repository';
import { GoogleAiService } from '../../shared/services/google-ai.service';
import { JsonAccessUtility } from '../../core/utilities/json-access.utility';

@Module({
  controllers: [InfringementController],
  providers: [
    InfringementService,
    PatentRepository,
    CompanyRepository,
    GoogleAiService,
    JsonAccessUtility,
  ],
})
export class InfringementModule {}
