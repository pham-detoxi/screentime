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
  async checkPermission(): Promise<boolean> {
    console.log('check if we already has user permission');
    return false
}

async showReport(): Promise<string> {
  return "eh"
  }
}
