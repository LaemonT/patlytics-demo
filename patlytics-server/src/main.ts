import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    // Enable CORS for dev
    // This option should be configured in prod for security
    cors: true,
  });
  await app.listen(process.env.PORT ?? 5438);
}
bootstrap();
