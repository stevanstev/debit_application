import 'dart:io';

import 'package:debit/src/blocs/register_bloc.dart';
import 'package:debit/src/events/register_event.dart';
import 'package:debit/src/states/register_state.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/debit_buttons.dart';
import 'package:debit/src/ui/utils/debit_form.dart';
import 'package:debit/src/ui/utils/debit_space.dart';
import 'package:debit/src/ui/utils/form_validation.dart';
import 'package:debit/src/ui/utils/logs.dart';
import 'package:debit/src/ui/utils/screen_size.dart';
import 'package:debit/src/ui/utils/strings.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:debit/src/ui/widgets/curve_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with FormValidation {
  RegisterBloc _bloc = RegisterBloc();
  GetDefaultState _defaultState =
      GetDefaultState(gender: 'Male', toggle: false, status: 'Single');
  List<String> _gender = ['Male', 'Female'];
  List<String> _status = ['Married', 'Single'];
  final picker = ImagePicker();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //will be moved
  File _idCard;
  File _photoWithIdCard;
  File _sign;
  String _bornDate;
  String _bornPlace;

  Widget _dateWidget = Text(
    '0000-00-00',
    style: simpleStyle(
        color: debitBlue900, fontSize: 17, fontWeight: FontWeight.w400),
  );

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future getImage({String stateName}) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera].request();

    if (statuses[Permission.camera] == PermissionStatus.granted) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          switch (stateName) {
            case 'idCard':
              _idCard = File(pickedFile.path);
              break;
            case 'photoWithIdCard':
              _photoWithIdCard = File(pickedFile.path);
              break;
            case 'sign':
              _sign = File(pickedFile.path);
              break;
            default:
              break;
          }
        } else {
          writeLog(
              logContext: 'Image Upload Status', message: 'Cancel to upload');
        }
      });
    } else {
      writeLog(
          logContext: 'Image Upload Status',
          message: 'No permission to camera');
    }
  }

  Form _registerForm(
      GetDefaultState data, bool isErrors, Map<String, dynamic> errors) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            debitNumberField(
              icon: Icons.phone,
              label: phoneNumberLabel,
              maxLength: 12,
              onChanged: (phone) {
                return phone;
              },
            ),
            debitCustomTopMargin(10),
            debitTextField(
                icon: Icons.person,
                label: fullNameLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(10),
            debitTextField(
                icon: Icons.branding_watermark,
                label: idCardNumberLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(10),
            debitNumberField(
              icon: Icons.fiber_pin,
              label: pinLabel,
              maxLength: 6,
              onChanged: null,
            ),
            debitCustomTopMargin(10),
            debitNumberField(
              icon: Icons.format_list_numbered,
              label: ageLabel,
              maxLength: 30,
              onChanged: null,
            ),
            debitCustomTopMargin(10),
            debitTextField(
                icon: Icons.chrome_reader_mode,
                label: familyCardNumberLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(10),
            debitSecureField(
                label: passwordLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(10),
            debitSecureField(
                label: rePasswordLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(10),
            debitTextField(
                icon: Icons.location_on,
                label: addressLabel,
                maxLength: 30,
                onChanged: null,
                validator: null),
            debitCustomTopMargin(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                header(
                    context: context,
                    text: selectInputSection,
                    type: 7,
                    fontSize: 20,
                    color: debitBlue900),
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ],
            ),
            debitCustomTopMargin(10),
            debitDropDown(
                validator: (v) {},
                icon: Icons.face,
                label: genderLabel,
                hint: Text(genderInputLabel),
                value: data.gender,
                items: _gender
                    .map((g) => DropdownMenuItem(
                          child: Text(
                            g,
                            style: TextStyle(color: debitBlack54),
                          ),
                          value: g,
                        ))
                    .toList(),
                onChanged: (g) {
                  FocusScope.of(context).unfocus();
                  _bloc.eventSink.add(SetDefaultEvent(
                    phoneNumber: data.phoneNumber,
                    toggle: data.toggle,
                    gender: g,
                    status: data.status,
                  ));
                }),
            debitCustomTopMargin(10),
            debitDropDown(
                validator: (v) {},
                icon: Icons.accessibility,
                label: statusLabel,
                hint: Text(statusInputLabel),
                value: data.status,
                items: _status
                    .map((s) => DropdownMenuItem(
                          child: Text(
                            s,
                            style: TextStyle(color: debitBlack54),
                          ),
                          value: s,
                        ))
                    .toList(),
                onChanged: (s) {
                  FocusScope.of(context).unfocus();
                  _bloc.eventSink.add(SetDefaultEvent(
                      toggle: data.toggle,
                      gender: data.gender,
                      status: s,
                      phoneNumber: data.phoneNumber));
                }),
            debitCustomTopMargin(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                header(
                    context: context,
                    text: selectDateSection,
                    type: 7,
                    fontSize: 20,
                    color: debitBlue900),
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ],
            ),
            debitCustomTopMargin(20),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.child_care,
                        color: debitBlue900,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _bornPlace ?? 'Nowhere',
                        style: simpleStyle(
                            color: debitBlue900,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ',',
                        style: simpleStyle(
                            color: debitBlue900,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      AnimatedSwitcher(
                        duration: Duration(seconds: 2),
                        child: _dateWidget,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  debitTextField(
                      icon: Icons.location_city,
                      label: bornPlaceLabel,
                      maxLength: 30,
                      onChanged: (bp) {
                        setState(() {
                          _bornPlace = bp;
                        });
                      },
                      validator: null),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: fullWidthSize(context: context),
                    height: fullHeightSize(context: context) * 0.06,
                    decoration: BoxDecoration(
                        color: debitBlue800,
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: RaisedButton(
                          color: debitBlue800,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: debitWhite,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Select Date',
                                style: simpleStyle(
                                  color: debitWhite,
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                onConfirm: (time) {
                              setState(() {
                                _bornDate = time.toString();
                                _dateWidget = Text(
                                  _bornDate.split(' ')[0] ?? '0000-00-00',
                                  style: simpleStyle(
                                      color: debitBlue900,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                );
                              });
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            debitCustomTopMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                header(
                    context: context,
                    text: imageUploadSection,
                    type: 7,
                    fontSize: 20,
                    color: debitBlue900),
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ],
            ),
            debitCustomTopMargin(30),
            imageUpload(
              placeholderIcon: Icons.person,
              buttonLabel: uploadButtonLabel,
              context: context,
              imageState: _idCard,
              onPressed: () => getImage(stateName: 'idCard'),
              itemLabel: idCardLabel,
            ),
            debitCustomTopMargin(30),
            imageUpload(
              placeholderIcon: Icons.supervised_user_circle,
              buttonLabel: uploadButtonLabel,
              context: context,
              imageState: _photoWithIdCard,
              onPressed: () => getImage(stateName: 'photoWithIdCard'),
              itemLabel: selfieWithIdCardLabel,
            ),
            debitCustomTopMargin(30),
            imageUpload(
              placeholderIcon: Icons.mode_edit,
              buttonLabel: uploadButtonLabel,
              context: context,
              imageState: _sign,
              onPressed: () => getImage(stateName: 'sign'),
              itemLabel: signLabel,
            ),
            debitCustomTopMargin(30),
            Row(
              children: [
                Checkbox(
                    value: data.toggle,
                    onChanged: (v) {
                      _bloc.eventSink.add(SetDefaultEvent(
                        phoneNumber: data.phoneNumber,
                        toggle: v,
                        gender: data.gender,
                        status: data.status,
                      ));
                    }),
                header(type: 5, text: agreeToTerms, color: debitBlack54),
                SizedBox(
                  width: 3,
                ),
                debitClickableWidget(
                    onTap: () {
                      showDialog(
                          builder: (context) {
                            return SimpleDialog(
                              title: header(
                                  type: 4,
                                  text: termsAndConditions,
                                  color: debitBlack54),
                              children: [
                                Column(
                                  children: [
                                    header(
                                        type: 5,
                                        text: loremIpsum,
                                        color: debitBlack54),
                                    header(
                                        type: 5,
                                        text: loremIpsum,
                                        color: debitBlack54),
                                    header(
                                        type: 5,
                                        text: loremIpsum,
                                        color: debitBlack54)
                                  ],
                                )
                              ],
                            );
                          },
                          context: context);
                    },
                    child: header(type: 5, text: here, color: debitRed800))
              ],
            ),
            debitCustomTopMargin(22),
            debitDefaultButton(
                labelColor: debitWhite,
                buttonColor: debitBlue900,
                height: MediaQuery.of(context).size.height * 0.06,
                label: registerSubmitLabel,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print('true');
                  } else {
                    print('false');
                  }
                },
                splashColor: debitBlue800),
          ],
        ));
  }

  Widget _mapStateToWidget(RegisterState data) {
    if (data is GetDefaultState) {
      return _registerForm(data, false, {});
    } else if (data is ValidationErrorState) {
      return CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.12,
            left: 30,
            right: 30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header(
                  context: context,
                  text: registerHeaderLabel,
                  type: 2,
                  color: debitBlack54),
              debitTopMargin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: CurvePainter(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  header(
                      context: context,
                      text: dataInputLabel,
                      type: 7,
                      fontSize: 20,
                      color: debitBlue900),
                  CustomPaint(
                    painter: CurvePainter(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                ],
              ),
              debitTopMargin(),
              Stack(
                children: [
                  StreamBuilder(
                      stream: _bloc.stateStream,
                      initialData: _defaultState,
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return _mapStateToWidget(snapshot.data);
                        }

                        return SizedBox();
                      }),
                ],
              ),
              debitCustomTopMargin(22),
              Column(
                children: [
                  header(
                      context: context,
                      text: alreadyHaveAccount,
                      type: 7,
                      fontSize: 13,
                      color: debitBlack54),
                  debitDefaultButton(
                      labelWeight: FontWeight.bold,
                      top: 3,
                      labelSize: 14,
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (Route<dynamic> route) => false);
                      },
                      labelColor: debitBlue800,
                      buttonColor: debitTransparent,
                      splashColor: debitBlue800,
                      label: loginButtonLabel,
                      height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
              debitCustomTopMargin(50),
            ],
          )
        ],
      ),
    );
  }
}
