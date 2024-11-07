import { Patent } from '../model/patent';

export class PatentEntity extends Patent {
  constructor(model: Partial<Patent>) {
    super();
    Object.assign(this, model);
  }
}
