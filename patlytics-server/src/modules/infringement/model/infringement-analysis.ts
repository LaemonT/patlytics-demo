export class InfringementAnalysis {
  analysis_id: string;
  patent_id: string;
  company_name: string;
  analysis_date: Date;
  top_infringing_products: TopInfringingProduct[];
  overall_risk_assessment: string;
}

export class TopInfringingProduct {
  product_name: string;
  infringement_likelihood: string;
  relevant_claims: string[];
  explanation: string;
  specific_features: string[];
}
