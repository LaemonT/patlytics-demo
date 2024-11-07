import { GoogleGenerativeAI } from '@google/generative-ai';
import { Injectable } from '@nestjs/common';

const MODEL_NAME = 'gemini-1.5-flash';

@Injectable()
export class GoogleAiService {
  private readonly genAi = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
  private readonly systemPrompt =
    'You are an institution providing patent search, analytics, and competitive insights utilities.';

  async generateContent(prompt: string, responseSchema?: any): Promise<string> {
    const model = this.genAi.getGenerativeModel({
      model: MODEL_NAME,
      systemInstruction: this.systemPrompt,
      generationConfig: {
        responseMimeType: 'application/json',
        responseSchema: responseSchema,
      },
    });

    const result = await model.generateContent(prompt);

    return result.response.text();
  }
}
