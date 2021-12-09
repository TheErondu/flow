import 'package:brave/home_page/home_page_widget.dart';
import 'package:brave/main.dart';
import 'package:brave/store_page/detail.dart';
import 'package:brave/store_page/store_item_detail.dart';
import 'package:brave/widgets/store_categories.dart';

import '../backend/api_requests/api_calls.dart';
import '../issues/detail.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StoreListWidget extends StatefulWidget {
  const StoreListWidget({Key key, this.status}) : super(key: key);
  final String status;

  @override
  _StoreListWidget createState() => _StoreListWidget();
}

class _StoreListWidget extends State<StoreListWidget> {
  Future<dynamic> getStoreInfo;
  TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
    getStoreInfo = getStoreInfoCall();
    print(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(
                      initialPage: "HomePage",
                    ),
                  ),
                )),
        backgroundColor: Color(0xFF090F13),
        automaticallyImplyLeading: true,
        title: Text(
          'Store Manager',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF262D34),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Store Manager',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  //Categories Widget
                  StoreCategoriesWidget(),
                  //
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.status ?? 'Store Request',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              FutureBuilder<dynamic>(
                future: getStoreInfo,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitChasingDots(
                          color: Color(0xFFCCC9C9),
                          size: 50,
                        ),
                      ),
                    );
                  }
                  final res = snapshot.data;
                  dynamic query;
                  if (widget.status == "Pending") {
                    query = getJsonField(res, r'''$..store_requests''');
                  } else if ((widget.status == "Approved")) {
                    query = getJsonField(res, r'''$..borrowed_items''');
                  } else if ((widget.status == "Returned")) {
                    query = getJsonField(res, r'''$..returned_items''');
                  } else if ((widget.status == "All")) {
                    query = getJsonField(res, r'''$..store_items''');
                  } else {
                    query = getJsonField(res, r'''$..store_requests''');
                  }

                  return Builder(
                    builder: (context) {
                      final reportsList = query?.toList() ?? [];
                      if (reportsList.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/No_Data_Found.png',
                            fit: BoxFit.scaleDown,
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(reportsList.length,
                              (reportsListIndex) {
                            final reportsListItem =
                                reportsList[reportsListIndex];
                            var i = reportsListIndex;
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 3),
                              child: InkWell(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF070D0F),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => widget
                                                          .status ==
                                                      "All"
                                                  ? StoreItemDetailpageWidget(
                                                      index: i)
                                                  : StoreRequestDetailpageWidget(
                                                      index: i,
                                                    ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 20, 20, 20),
                                                  child: Icon(
                                                    Icons
                                                        .sticky_note_2_outlined,
                                                    color: Color(0xFF6F6C6C),
                                                    size: 40,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 1, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AutoSizeText(
                                                          widget.status == "All"
                                                              ? getJsonField(
                                                                      reportsListItem,
                                                                      r'''$..item_name''')
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25,
                                                                    replacement:
                                                                        '…',
                                                                  )
                                                              : getJsonField(
                                                                      reportsListItem,
                                                                      r'''$..item''')
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          widget.status == "All"
                                                              ? getJsonField(
                                                                  reportsListItem,
                                                                  r'''$..serial_no'''
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ))
                                                              : getJsonField(
                                                                      reportsListItem,
                                                                      r'''$..status''')
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        35,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF8B97A2),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          widget.status == "All"
                                                              ? getJsonField(
                                                                      reportsListItem,
                                                                      r'''$..assigned_department''')
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25,
                                                                    replacement:
                                                                        '…',
                                                                  )
                                                              : getJsonField(
                                                                      reportsListItem,
                                                                      r'''$..return_date''') ??
                                                                  'date'
                                                                      .toString(),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF4B39EF),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_outlined,
                                                      color: Color(0xFF95A1AC),
                                                      size: 24,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
