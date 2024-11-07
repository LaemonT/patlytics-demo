import { Injectable, OnModuleInit } from '@nestjs/common';
import { JsonAccessUtility } from 'src/core/utilities/json-access.utility';
import { Company, CompanyProduct } from '../../model/company';

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
    return this.companies.find((item) => item.name === name);
  }
}
