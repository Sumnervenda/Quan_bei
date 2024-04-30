// /*
//  * Copyright (c) 2022 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
//
// import {Piece_of_data} from '../Component/Piece_of_data'
// import router from '@ohos.router';
// import add_Target from '../view/add_Target';
// /**
//  * Home tab content
//  */
//
// @Component
// export default  struct Home {
//   private swiperController: SwiperController = new SwiperController();
//   scroller: Scroller = new Scroller()
//
//
//   dialogController: CustomDialogController = new CustomDialogController({
//     builder: add_Target({
//       onClickOk: (value1: string,value2:string,value3:string,value4:string,value5:boolean): void => this.saveTask(value1,value2,value3,value4,value5)
//     }),
//     alignment: DialogAlignment.Bottom,
//     offset: {
//       dx: 0,
//       dy: 100
//     },
//     customStyle: true,
//     autoCancel: false
//   });
//
//   build() {
//     Stack() {
//
//
//       List({space:8}) {
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月12日',
//             img_deal: $r('app.media.main_logo'), //参数如下
//             deal_labels: '早餐',
//             buy_labels: '堂食',
//             money: '-36.0'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月13日',
//             img_deal: $r('app.media.deal_img'),
//             deal_labels: '午餐',
//             buy_labels: '外卖',
//             money: '-16.8'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.deal_img'),
//             deal_labels: '购物',
//             buy_labels: '线上支付',
//             money: '188.0'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Piece_of_data({
//             Date_mm_dd_week: '04月14日',
//             img_deal: $r('app.media.icon'),
//             deal_labels: '晚餐',
//             buy_labels: '外卖',
//             money: '-22.1'
//           })
//         }
//
//         ListItem() {
//           Row()
//             .width('100%')
//             .height(600)
//         }
//
//       }
//       .edgeEffect(EdgeEffect.Spring)
//       .onScroll((xOffset: number, yOffset: number) => {
//         console.info(xOffset + ' ' + yOffset)
//       })
//       .width('100%')
//       .alignListItem(ListItemAlign.Center)
//
//       Image('assets/add_button.png') //添加一项新的事项按钮
//         .width(80)
//         .height(80)
//         .margin({
//           left: 256,
//           top: 80
//         })
//         .onClick(() => {  //跳转到新的页面
//           router.pushUrl({
//             url: 'pages/index_jump_to_add'
//           })
//         })
//         .position({ x: '75%', y: '80%' })
//
//
//       Divider()//这个是分割线
//         .strokeWidth(2)
//         .color('#ff000000')
//         .opacity(0.15)
//         .position({ x: '0%', y: '99.9%' })
//
//
//     }
//   }
//
//   saveTask(value1: string,value2:string,value3:string,value4:string,value5:boolean){
//
//   }
// }
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


import AddTargetDialog from '../view/AddTargetDialog';
import TargetList from '../view/TargetList';
import DataModel, { TaskItemBean } from '../viewmodel/DataModel';
import { CommonConstants } from '../common/constant/CommonConstant';

import promptAction from '@ohos.promptAction';

@Component
export default  struct Home {
  @State targetData: Array<TaskItemBean> = DataModel.getData();
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State latestUpdateDate: string = CommonConstants.DEFAULT_PROGRESS_VALUE;
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({
      onClickOk: (value1: string,value2:string,value3:string,value4:string,value5:boolean): void => this.saveTask(value1,value2,value3,value4,value5)
    }),
    alignment: DialogAlignment.Bottom,
    offset: {
      dx: 0,
      dy: 0
    },
    customStyle: true,
    autoCancel: false
  });

  /**
   * Listening targetData.
   */
  onProgressChanged() {
    this.totalTasksNumber = this.targetData.length;
    // this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
    //   return item.progressValue === CommonConstants.SLIDER_MAX_VALUE;
    // }).length;
  }

  build() {
    Column() {
      // this.titleBar()

      TargetList({
        targetData: $targetData,
        onAddClick: (): void => this.dialogController.open()
      })
        .height('100%')
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  titleBar() {
    Text('title')
      .width(CommonConstants.TITLE_WIDTH)
      .height($r('app.float.title_height'))
      .fontSize($r('app.float.title_font'))
      .fontWeight(CommonConstants.FONT_WEIGHT_LARGE)
      .textAlign(TextAlign.Start)
      .margin({
        top: $r('app.float.title_margin'),
        bottom: $r('app.float.title_margin')
      })
  }

  /**
   * Save the progress value and update time after you click OK in the dialog box.
   *
   * @param taskName Latest Progress Value.
   */
  saveTask(value1: string,value2:string,value3:string,value4:string,value5:boolean) {
    if (value1 === '') {
      promptAction.showToast({
        message: "消费类型不能为空",
        duration: 2000,
        bottom: 64
      });
      return;
    }
    DataModel.addData(new TaskItemBean(value1,value2,value3,value4,value5));
    this.targetData = DataModel.getData();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.dialogController.close();
  }
}
