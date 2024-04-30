// /*
//  * Copyright (c) 2023 Huawei Device Co., Ltd.
//  * Licensed under the Apache License,Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  * http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
//
//
// import promptAction from '@ohos.promptAction';
//
// @Entry
// @Component
// @CustomDialog
// struct MainPage {
//   // @State targetData: Array<TaskItemBean> = DataModel.getData();
//   // @State totalTasksNumber: number = 0;
//   // @State completedTasksNumber: number = 0;
//   // @State latestUpdateDate: string = CommonConstants.DEFAULT_PROGRESS_VALUE;
//   // @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;
//   dialogController: CustomDialogController = new CustomDialogController({
//     builder: add_Target({
//       onClickOk: (value: string): void => this.saveTask(value)
//     }),
//     alignment: DialogAlignment.Bottom,
//     offset: {
//       dx: 1,
//       dy: 2
//     },
//     customStyle: true,
//     autoCancel: false
//   });
//
//   /**
//    * Listening targetData.
//    */
//   onProgressChanged() {
//     this.totalTasksNumber = this.targetData.length;
//     this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
//       return item.progressValue === CommonConstants.SLIDER_MAX_VALUE;
//     }).length;
//     this.latestUpdateDate = getCurrentTime();
//   }
//
//   build() {
//     Column() {
//       this.titleBar()
//       TargetInformation({
//         latestUpdateDate: this.latestUpdateDate,
//         totalTasksNumber: this.totalTasksNumber,
//         completedTasksNumber: this.completedTasksNumber
//       })
//       TargetList({
//         targetData: $targetData,
//         onAddClick: (): void => this.dialogController.open()
//       })
//         .height(CommonConstants.LIST_BOARD_HEIGHT)
//     }
//     .width(CommonConstants.FULL_WIDTH)
//     .height(CommonConstants.FULL_HEIGHT)
//     .backgroundColor($r('app.color.index_background'))
//   }
//
//
//   /**
//    * Save the progress value and update time after you click OK in the dialog box.
//    *
//    * @param taskName Latest Progress Value.
//    */
//   saveTask(taskName: string) {
//
//     DataModel.addData(new TaskItemBean(taskName, 0, getCurrentTime()));
//     this.targetData = DataModel.getData();
//     this.overAllProgressChanged = !this.overAllProgressChanged;
//     this.dialogController.close();
//   }
// }