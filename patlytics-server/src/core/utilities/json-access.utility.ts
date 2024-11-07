import { Injectable, InternalServerErrorException } from '@nestjs/common';
import * as fs from 'fs';
import * as path from 'path';

@Injectable()
export class JsonAccessUtility {
  // Load and parse the JSON file into a specific type
  async loadJson<T>(filePath: string) {
    try {
      const jsonData = await fs.promises.readFile(
        path.resolve(filePath),
        'utf-8',
      );
      return JSON.parse(jsonData) as T;
    } catch (error) {
      throw new InternalServerErrorException(
        `Failed to read or parse JSON file: ${error}`,
      );
    }
  }
}
