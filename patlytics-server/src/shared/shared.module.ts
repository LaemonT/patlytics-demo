import { Module } from '@nestjs/common';
import { GoogleAiService } from './services/google-ai.service';

@Module({
  providers: [GoogleAiService],
  exports: [GoogleAiService],
})
export class SharedModule {}
