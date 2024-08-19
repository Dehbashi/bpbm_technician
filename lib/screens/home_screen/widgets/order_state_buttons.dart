import 'package:bpbm_technician/common/widgets/button_widget_normal.dart';
import 'package:flutter/material.dart';
import 'package:bpbm_technician/common/constants_2.dart';
import 'package:bpbm_technician/common/widgets/confirmation_dialog.dart';
import 'package:bpbm_technician/services/state_service.dart';

class OrderStateButtons extends StatefulWidget {
  // const OrderState({super.key});
  int orderStatus;
  final int id;

  OrderStateButtons({required this.orderStatus, required this.id});

  @override
  State<OrderStateButtons> createState() => _OrderStateButtonsState();
}

class _OrderStateButtonsState extends State<OrderStateButtons> {
  @override
  Widget build(BuildContext context) {
    Widget buttons;
    const double width = 220;

    switch (widget.orderStatus) {
      case 3:
        buttons = Column(
          children: [
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        title: 'تأیید',
                        message: 'آیا از پذیرفتن سفارش مطمئن هستید؟',
                        onConfirm: () {
                          StateService(status: 4, id: widget.id).getStatus();
                          setState(() {
                            widget.orderStatus = 4;
                          });
                        },
                      );
                    });
              },
              buttonType: ButtonWidgetType.accept,
              text: 'قبول سفارش',
            ),
            const SizedBox(height: 10),
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        title: 'تأیید',
                        message: 'آیا از رد سفارش مطمئن هستید؟',
                        onConfirm: () {
                          StateService(status: 1, id: widget.id).getStatus();
                          setState(() {
                            widget.orderStatus = 1;
                          });
                        },
                      );
                    });
              },
              buttonType: ButtonWidgetType.cancel,
              text: 'رد سفارش',
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: 220,
            //   height: 70,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //               title: 'تأیید',
            //               message: 'آیا از پذیرفتن سفارش مطمئن هستید؟',
            //               onConfirm: () {
            //                 StateService(status: 4, id: widget.id).getStatus();
            //                 setState(() {
            //                   widget.orderStatus = 4;
            //                 });
            //               },
            //             );
            //           });
            //     },
            //     child: Text('قبول سفارش'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.accept),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //               title: 'تأیید',
            //               message: 'آیا از رد سفارش مطمئن هستید؟',
            //               onConfirm: () {
            //                 StateService(status: 1, id: widget.id).getStatus();
            //                 setState(() {
            //                   widget.orderStatus = 1;
            //                 });
            //               },
            //             );
            //           });
            //     },
            //     child: Text('رد سفارش'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.cancel),
            //   ),
            // ),
          ],
        );

      case 4:
        buttons = Column(
          children: [
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        title: 'تایید',
                        message: 'آیا از حضور مشتری اطمینان دارید؟',
                        onConfirm: () {
                          StateService(status: 6, id: widget.id).getStatus();
                          setState(() {
                            widget.orderStatus = 6;
                          });
                        },
                      );
                    });
              },
              buttonType: ButtonWidgetType.accept,
              text: 'حضور مشتری',
            ),
            const SizedBox(width: 10),
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        title: 'تایید',
                        message: 'آیا از عدم حضور مشتری اطمینان دارید؟',
                        onConfirm: () {
                          StateService(status: 5, id: widget.id).getStatus();
                          setState(() {
                            widget.orderStatus = 5;
                          });
                        },
                      );
                    });
              },
              buttonType: ButtonWidgetType.cancel,
              text: 'عدم حضور مشتری',
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //               title: 'تایید',
            //               message: 'آیا از حضور مشتری اطمینان دارید؟',
            //               onConfirm: () {
            //                 StateService(status: 6, id: widget.id).getStatus();
            //                 setState(() {
            //                   widget.orderStatus = 6;
            //                 });
            //               },
            //             );
            //           });
            //     },
            //     child: Text('حضور مشتری'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.accept),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //               title: 'تایید',
            //               message: 'آیا از عدم حضور مشتری اطمینان دارید؟',
            //               onConfirm: () {
            //                 StateService(status: 5, id: widget.id).getStatus();
            //                 setState(() {
            //                   widget.orderStatus = 5;
            //                 });
            //               },
            //             );
            //           });
            //     },
            //     child: Text('عدم حضور مشتری'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.cancel),
            //   ),
            // ),
          ],
        );

      case 6:
        buttons = Column(
          children: [
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                          title: 'تأیید',
                          message: 'آیا نیاز به خرید اقلام دارید؟',
                          onConfirm: () {
                            StateService(status: 7, id: widget.id).getStatus();
                            setState(() {
                              widget.orderStatus = 7;
                            });
                          });
                    });
              },
              buttonType: ButtonWidgetType.accept,
              text: 'نیاز به خرید اقلام',
            ),
            const SizedBox(height: 10),
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                          title: 'تأیید',
                          message: 'آیا از اتمام کار اطمینان دارید؟',
                          onConfirm: () {
                            StateService(status: 8, id: widget.id).getStatus();
                            setState(() {
                              widget.orderStatus = 8;
                            });
                          });
                    });
              },
              buttonType: ButtonWidgetType.cancel,
              text: 'اتمام کار',
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //                 title: 'تأیید',
            //                 message: 'آیا نیاز به خرید اقلام دارید؟',
            //                 onConfirm: () {
            //                   StateService(status: 7, id: widget.id)
            //                       .getStatus();
            //                   setState(() {
            //                     widget.orderStatus = 7;
            //                   });
            //                 });
            //           });
            //     },
            //     child: Text('نیاز به خرید اقلام'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.accept),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //                 title: 'تأیید',
            //                 message: 'آیا از اتمام کار اطمینان دارید؟',
            //                 onConfirm: () {
            //                   StateService(status: 8, id: widget.id)
            //                       .getStatus();
            //                   setState(() {
            //                     widget.orderStatus = 8;
            //                   });
            //                 });
            //           });
            //     },
            //     child: Text('اتمام کار'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.cancel),
            //   ),
            // ),
          ],
        );

      case 7:
        buttons = Column(
          children: [
            ButtonWidgetNormal(
              width: width,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                          title: 'تأیید',
                          message: 'آیا از اتمام کار اطمینان دارید؟',
                          onConfirm: () {
                            StateService(status: 8, id: widget.id).getStatus();
                            setState(() {
                              widget.orderStatus = 8;
                            });
                          });
                    });
              },
              buttonType: ButtonWidgetType.accept,
              text: 'اتمام کار',
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: Constants.buttonWidth,
            //   height: Constants.buttonHeight,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return ConfirmationDialog(
            //                 title: 'تأیید',
            //                 message: 'آیا از اتمام کار اطمینان دارید؟',
            //                 onConfirm: () {
            //                   StateService(status: 8, id: widget.id)
            //                       .getStatus();
            //                   setState(() {
            //                     widget.orderStatus = 8;
            //                   });
            //                 });
            //           });
            //     },
            //     child: Text('اتمام کار'),
            //     style: Constants.getElevatedButtonStyle(ButtonType.accept),
            //   ),
            // ),
          ],
        );

      default:
        buttons = Container();
    }

    return buttons;
  }
}
