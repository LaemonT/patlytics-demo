import { Module } from '@nestjs/common';
import { JsonAccessUtility } from './utilities/json-access.utility';

@Module({
  providers: [JsonAccessUtility],
  exports: [JsonAccessUtility],
})
export class CoreModule {}
