/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


@Entry
@Component
@CustomDialog
struct AddTargetDialog {
  @State subtaskName: string = '';
  private controller?: CustomDialogController;
  onClickOk?: (value: string) => void;

  build() {
    Column() {
      Text($r('app.media.app_icon'))
        .width('100%')

      TextInput({ placeholder: "输入东西"})
        .placeholderColor(Color.Grey)
        .onChange((value: string) => {
          this.subtaskName = value;
        })
      Blank()
      Row() {
        Button("取消")

          .onClick(() => {
            this.controller?.close();
          })

        Button("确认")

          .onClick(() => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.subtaskName);
            }
          })
      }

      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}

/**
 * Custom button style.
 */
@Extend(Button) function dialogButtonStyle() {

  .backgroundColor(Color.White)

}