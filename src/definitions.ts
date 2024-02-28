export interface ScreenTimeActivityPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
