import { registerPlugin } from '@capacitor/core';

import type { ScreenTimeActivityPlugin } from './definitions';

const ScreenTimeActivity = registerPlugin<ScreenTimeActivityPlugin>(
  'ScreenTimeActivity',
  {
    web: () => import('./web').then(m => new m.ScreenTimeActivityWeb()),
  },
);

export * from './definitions';
export { ScreenTimeActivity };
