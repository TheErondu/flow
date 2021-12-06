
import 'package:brave/issues/index.dart';
import 'package:brave/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
 
class IssueCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 1, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF090F13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IssuesListWidget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFF262D34),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.list_alt_sharp,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Raised issues',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF090F13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IssuesListWidget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFF262D34),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.list_alt_sharp,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'All Issues',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
             
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            //   child: Material(
            //     color: Colors.transparent,
            //     elevation: 2,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Container(
            //       width: 100,
            //       height: 100,
            //       decoration: BoxDecoration(
            //         color: Color(0xFF090F13),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: InkWell(
            //         onTap: () async {
            //           await Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => ReportsListViewWidget(),
            //             ),
            //           );
            //         },
            //         child: Column(
            //           mainAxisSize: MainAxisSize.max,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Container(
            //               width: 48,
            //               height: 48,
            //               decoration: BoxDecoration(
            //                 color: Color(0xFF262D34),
            //                 shape: BoxShape.circle,
            //               ),
            //               child: Icon(
            //                 Icons.list_alt_sharp,
            //                 color: Colors.white,
            //                 size: 32,
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            //               child: Text(
            //                 'Prompter Logs Shows',
            //                 textAlign: TextAlign.center,
            //                 style: FlutterFlowTheme.bodyText2.override(
            //                   fontFamily: 'Lexend Deca',
            //                   color: Color(0xFF8B97A2),
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.normal,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            
          ],
        ),
      ),
    );
  }
}
