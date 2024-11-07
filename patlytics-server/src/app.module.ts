import { Module } from '@nestjs/common';
import { InfringementModule } from './modules/infringement/infringement.module';
import { CoreModule } from './core/core.module';
import { SharedModule } from './shared/shared.module';

@Module({
  imports: [CoreModule, SharedModule, InfringementModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
