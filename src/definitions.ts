export interface ScreenTimeActivityPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  checkPermission(): Promise<boolean>;
  showReport(): Promise<string>;
}
