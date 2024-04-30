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

// import TargetListItem from './TargetListItem';

import DataModel, { TaskItemBean } from '../viewmodel/DataModel';
import {Piece_of_data} from '../Component/piece_of_data';

@Component
export default struct TargetList {
  @Consume overAllProgressChanged: boolean;
  @State isEditMode: boolean = false;
  @State selectArray: Array<boolean> = [];
  @State clickIndex: number = -1;
  @State selectAll: boolean = false;
  @Link targetData: Array<TaskItemBean>;
  onAddClick?: () => void;

  build() {
    Stack() {
      Column() {
        Row() {
          Text("我的收支")
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#ff1a1a1a')
          Blank()
          if (this.targetData.length > 0) {
            if (this.isEditMode) {
              Text('取消')
                .operateTextStyle($r('app.color.main_blue'))
                .margin({ left: 10 })
                .onClick(() => {
                  this.selectAll = false;
                  this.isEditMode = false;
                  this.selectAllOrCancel(false);
                })
              Text("全选")
                .operateTextStyle($r('app.color.main_blue'))
                .margin({
                  left: 20
                })
              Checkbox()
                .select(this.isSelectAll())
                .selectedColor($r('app.color.main_blue'))
                .width(12)
                .onClick(() => {
                  this.selectAll = !this.selectAll;
                  this.selectAllOrCancel(this.selectAll);
                })
            } else {
              Text("编辑")
                .operateTextStyle($r('app.color.main_blue'))
                .onClick(() => {
                  this.isEditMode = true;
                  this.selectAllOrCancel(false);
                })
            }
          }
        }
        .width("100%")
        .height(32)
        .padding({
          left: 16,
          right: 11
        })

        List({ space: 8 }) {
          ForEach(this.targetData, (item: TaskItemBean, index: number | undefined) => {
            ListItem() {
              Piece_of_data({
                // taskItem: item,
                index: index,
                selectArr: $selectArray,
                isEditMode: this.isEditMode,
                clickIndex: $clickIndex,
                Date_mm_dd_week: item.date_picker,
                // img_deal: $r('app.media.main_logo'), //参数如下
                deal_labels: item.deal_name,
                buy_labels: item.spend_type,
                money: item.spend_money,
              })
            }
          }, (item: TaskItemBean) => JSON.stringify(item))
          ListItem(){
            Row(){
              Blank().height('10%')
            }
            .width('100%')
          }

        }
        .edgeEffect(EdgeEffect.None)
        .margin({ top: 12 })
        .width('100%')
        .height('100%')

        Blank()

      }
      .width('93.3%')
      .height('100%')
      .padding({ top: 16 })

      if (this.isEditMode) {
        Button('删除')
          .opacity(this.isSelectRows() ? 1 : 0.4)
          .enabled(this.isSelectRows() ? true : false)
          .operateButtonStyle($r('app.color.main_red'))
          .position({x:'30%',y:'90%'})
          .onClick(() => {
            this.deleteSelected();
            this.selectAllOrCancel(false);
            this.selectAll = false;
          })
      } else {
        Image('assets/add_button.png') //添加一项新的事项按钮
          .width(100)
          .height(100)
          .position({ x: '70%', y: '80%' })
          .onClick(() => {
            if (this.onAddClick !== undefined) {
              this.onAddClick()
            }
          })
      }
    }.height('100%')
    .width('100%')
  }

  /**
   * Delete the selected item and exit the editing mode.
   */
  deleteSelected() {
    DataModel.deleteData(this.selectArray);
    this.targetData = DataModel.getData();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.isEditMode = false;
  }

  /**
   * Select or deselect all.
   *
   * @param selectStatus true: Select all. Otherwise, deselect all.
   */
  selectAllOrCancel(selectStatus: boolean) {
    let newSelectArray: Array<boolean> = [];
    this.targetData.forEach(() => {
      newSelectArray.push(selectStatus);
    });
    this.selectArray = newSelectArray;
  }

  /**
   * Whether to select all.
   */
  isSelectAll(): boolean {
    if (this.selectArray.length === 0) {
      return false;
    }
    let deSelectCount: Length = this.selectArray.filter((selected: boolean) => selected === false).length;
    if (deSelectCount === 0) {
      this.selectAll = true;
      return true;
    }
    this.selectAll = false;
    return false;
  }

  /**
   * Check whether there are selected rows.
   */
  isSelectRows(): boolean {
    return this.selectArray.filter((selected: boolean) => selected === true).length !== 0;
  }
}

/**
 * Custom text button style.
 */
@Extend(Text) function operateTextStyle(color: Resource) {
  .fontSize(16)
  .fontColor(color)
  .lineHeight(19)
  .fontWeight(500)
}

/**
 * Custom button style.
 */
@Extend(Button) function operateButtonStyle(color: Resource) {
  .width(156)
  .height(40)
  .fontSize(16)
  .fontWeight(500)
  .fontColor(color)
  .backgroundColor("#0D182431")
}