import { Injectable, OnModuleInit } from '@nestjs/common';
import { JsonAccessUtility } from 'src/core/utilities/json-access.utility';
import { Company, CompanyProduct } from '../../model/company';
import Fuse from 'fuse.js';

@Injectable()
export class CompanyRepository implements OnModuleInit {
  private readonly filePath =
    'src/modules/infringement/infra/data/company_products.json';

  private companies: Company[];

  constructor(private readonly jsonAccessUtility: JsonAccessUtility) {}

  // Load the JSON data when the repository is initialized
  async onModuleInit() {
    const companyProduct =
      await this.jsonAccessUtility.loadJson<CompanyProduct>(this.filePath);
    this.companies = companyProduct.companies;
  }

  findByName(name: string) {
    // Fuzzy search for the company name to find the closest match
    const fuse = new Fuse(this.companies, {
      keys: ['name'],
      threshold: 0.2,
      shouldSort: true,
    });
    const result = fuse.search(name);
    if (result.length > 0) {
      return result[0].item;
    } else {
      return null;
    }
  }
}
