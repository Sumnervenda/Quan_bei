

import http from '@ohos.net.http';
import AddTargetDialog from '../view/AddTargetDialog';
import TargetList from '../view/TargetList';
import DataModel, { TaskItemBean } from '../viewmodel/DataModel';
import  CommonConstant  from '../common/constant/CommonConstant';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import UIAbility from '@ohos.app.ability.UIAbility';


@Component
export default  struct Home {
  @State targetData: Array<TaskItemBean> = DataModel.getData();
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State latestUpdateDate: string = CommonConstant.DEFAULT_PROGRESS_VALUE;
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
    .width(CommonConstant.FULL_WIDTH)
    .height(CommonConstant.FULL_HEIGHT)
    .backgroundColor('#fffcfcfc')
  }

  @Builder
  titleBar() {
    Text('title')
      .width(CommonConstant.TITLE_WIDTH)
      .height($r('app.float.title_height'))
      .fontSize($r('app.float.title_font'))
      .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
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
    DataModel.addData(new TaskItemBean(0,value1,value2,value3,value4,value5));
    this.targetData = DataModel.getData();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.dialogController.close();
  }
}

