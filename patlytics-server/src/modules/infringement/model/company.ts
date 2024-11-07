export interface CompanyProduct {
  companies: Company[];
}
export interface Company {
  name: string;
  products: Product[];
}

export interface Product {
  name: string;
  description: string;
}
