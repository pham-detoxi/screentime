import { WebPlugin } from '@capacitor/core';

import type { ScreenTimeActivityPlugin } from './definitions';

export class ScreenTimeActivityWeb
  extends WebPlugin
  implements ScreenTimeActivityPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
