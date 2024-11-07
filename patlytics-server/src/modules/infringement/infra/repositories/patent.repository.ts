import { Injectable, OnModuleInit } from '@nestjs/common';
import { JsonAccessUtility } from '../../../../core/utilities/json-access.utility';
import { Patent } from '../../model/patent';

@Injectable()
export class PatentRepository implements OnModuleInit {
  private readonly filePath =
    'src/modules/infringement/infra/data/patents.json';

  private patents: Patent[];

  constructor(private readonly jsonAccessUtility: JsonAccessUtility) {}

  // Load the JSON data when the repository is initialized
  async onModuleInit() {
    this.patents = await this.jsonAccessUtility.loadJson<Patent[]>(
      this.filePath,
    );
  }

  findById(id: string) {
    return this.patents.find((item) => item.publication_number === id);
  }
}
