import 'package:flutter/material.dart';
import 'package:flutter_app_testing/test_widget/widget_with_icon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ***************************************************************************
  // * CommonFinders: ancestor                                                 *
  // ***************************************************************************
  // Finds widgets that are ancestors of the of parameter and
  // that match the matching parameter.
  testWidgets('finds acestors of the of parameter'
      ' that match the matching parameter', (WidgetTester tester) async {

    // Provide the Text widget as child of Opacity widget.
    await tester.pumpWidget(MaterialApp(
      home: Opacity(opacity: 0.5, child: Text('faded'),),));

    // Test if a Text widget that contains 'faded' is the
    // descendant of an Opacity widget with opacity 0.5:
    expect(
        tester.widget<Opacity>(
            find.ancestor(
              of: find.text('faded'),
              matching: find.byType(Opacity),
            )
        ).opacity,
        0.5
    );
  });

  // ***************************************************************************
  // * CommonFinders: byElementPredicate                                       *
  // ***************************************************************************
  // Finds widgets using an element predicate.
  group('finds widget by element predicate', (){
    testWidgets('finds a widget of given predicate',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(Padding(padding: EdgeInsets.zero,));

          expect(find.byElementPredicate(
            // finds elements of type SingleChildRenderObjectElement, including
            // those that are actually subclasses of that type.
            // (contrast with byElementType, which only returns exact matches)
                (Element element) => element is SingleChildRenderObjectElement,
            description: '$SingleChildRenderObjectElement element',
          ), findsOneWidget);
        });

    testWidgets('empty Container has two SingleChildRenderObjectElements',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(Container());

          expect(find.byElementPredicate(
            // finds elements of type SingleChildRenderObjectElement, including
            // those that are actually subclasses of that type.
            // (contrast with byElementType, which only returns exact matches)
                (Element element) => element is SingleChildRenderObjectElement,
            description: '$SingleChildRenderObjectElement element',
          ), findsNWidgets(2));
        });

  });

  // ***************************************************************************
  // * CommonFinders: byElementType                                            *
  // ***************************************************************************
  // Finds widgets by searching for elements with a particular type.
  group('finds widget by element type', (){
    testWidgets('finds one widget of SingleChildRenderObjectElement type',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(Padding(padding: EdgeInsets.zero,));

          expect(find.byElementType(SingleChildRenderObjectElement),
              findsOneWidget);
        });

    testWidgets('empty Container contains two widgets '
        'of SingleChildRenderObjectElement type',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(Container());

          expect(find.byElementType(SingleChildRenderObjectElement),
              findsNWidgets(2));
        });

  });

  // ***************************************************************************
  // * CommonFinders: byIcon                                                   *
  // ***************************************************************************
  // Finds Icon widgets containing icon data equal to the icon argument.
  testWidgets('finds Icon widget containing Icons.inbox icon data',
          (WidgetTester tester) async {

    // Provide the Text widget as child of Opacity widget.
    await tester.pumpWidget(MaterialApp(
      home: Icon(Icons.inbox)));

    expect(find.byIcon(Icons.inbox), findsOneWidget);
  });

  // ***************************************************************************
  // * CommonFinders: byIcon                                                   *
  // ***************************************************************************
  // Find a widget with a specific Key
  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    // Define the test key.
    final testKey = Key('K');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

  // ***************************************************************************
  // * CommonFinders: bySemanticsLabel                                         *
  // ***************************************************************************
  // Finds Semantics widgets matching the given label,
  // either by RegExp.hasMatch or string equality.
  group('finds widget by semantics label', (){
    testWidgets('finds one widget with semantic label "Black"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Icon(Icons.color_lens, semanticLabel: "Black",)));

          expect(find.bySemanticsLabel("Black"),
              findsOneWidget);
        });

    testWidgets('finds no widget with semantic label "Black"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Icon(Icons.color_lens, semanticLabel: "White",)));

          expect(find.bySemanticsLabel("Black"),
              findsNWidgets(0));
        });

  });

  // ***************************************************************************
  // * CommonFinders: byTooltip                                                *
  // ***************************************************************************
  // Finds Tooltip widgets with the given message.
  group('finds widget by tooltip', (){
    testWidgets('finds one Tooltip with message "Back"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Tooltip(message:"Back")));

          expect(find.bySemanticsLabel("Back"),
              findsOneWidget);
        });

    testWidgets('finds no Tooltip with message "Back"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Tooltip(message: "Next",)));

          expect(find.bySemanticsLabel("Back"),
              findsNWidgets(0));
        });

  });

  // ***************************************************************************
  // * CommonFinders: byType                                                   *
  // ***************************************************************************
  // Finds widgets by searching for widgets with a particular type.
  //
  // This does not do subclass tests, so for example byType(StatefulWidget)
  // will never find anything since that's an abstract class.
  //
  // The type argument must be a subclass of Widget.
  group('finds widget by type', (){
    testWidgets('finds one MaterialApp widget',
            (WidgetTester tester) async {

          await tester.pumpWidget(MaterialApp(
              home:Scaffold(body: Container(child: Text("body")),)));

          expect(find.byType(MaterialApp),
              findsOneWidget);
        });

    testWidgets('finds no StatefulWidget',
            (WidgetTester tester) async {

              await tester.pumpWidget(MaterialApp(
                  home:Scaffold(body: Container(child: Text("body")),)));

              expect(find.byType(StatefulWidget),
              findsNWidgets(0));
        });

  });

  // ***************************************************************************
  // * CommonFinders: byWidget                                                 *
  // ***************************************************************************
  // Finds widgets whose current widget is the instance given by the argument.
  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  // ***************************************************************************
  // * CommonFinders: byWidgetPredicate                                        *
  // ***************************************************************************
  // Finds widgets using a widget predicate
  group('finds widgets using a widget predicate', (){
    testWidgets('finds one Tooltip with message "Back"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Tooltip(message:"Back")));

          expect(find.byWidgetPredicate(
                (Widget widget) => widget is Tooltip && widget.message == 'Back',
            description: 'widget with tooltip "Back"',
          ), findsOneWidget);
        });

    testWidgets('finds no Tooltip with message "Back"',
            (WidgetTester tester) async {

          // Provide the SingleChildRenderObjectElement widget.
          await tester.pumpWidget(MaterialApp(
              home:Tooltip(message: "Next",)));

          expect(find.byWidgetPredicate(
                (Widget widget) => widget is Tooltip && widget.message == 'Back',
            description: 'widget with tooltip "Back"',
          ), findsNWidgets(0));
        });

  });

  // ***************************************************************************
  // * CommonFinders: descendant                                               *
  // ***************************************************************************
  // Finds widgets that are descendants of the of parameter
  // and that match the matching parameter.
  group('finds descendants widgets', (){
    testWidgets('finds one widget descendant of Row with text "awesome"',
            (WidgetTester tester) async {

          await tester.pumpWidget(MaterialApp(
              home: Scaffold(
                body: Row(
                  children: [
                    Text('label_1'),
                    Expanded(child: TextFormField(initialValue: "value_1",)),
                  ],
                ),
              ),
          ));

          expect(find.descendant(
              of: find.widgetWithText(Row, 'label_1'),
              matching: find.text('value_1')
          ), findsOneWidget);
        });

    testWidgets('finds no Tooltip with message "Back"',
            (WidgetTester tester) async {

              await tester.pumpWidget(MaterialApp(
                home: Scaffold(
                  body: Row(
                    children: [
                      Text('label_2'),
                      Expanded(child: TextFormField(initialValue: "value_2",)),
                    ],
                  ),
                ),
              ));

              expect(find.descendant(
                  of: find.widgetWithText(Row, 'label_1'),
                  matching: find.text('value_1')
              ), findsNWidgets(0));
            });

  });

  // ***************************************************************************
  // * CommonFinders: text                                                     *
  // ***************************************************************************
  // Find a Text widget
  testWidgets('finds a Text widget', (WidgetTester tester) async {
    // Build an app with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text('H'), findsOneWidget);
  });

  // ***************************************************************************
  // * CommonFinders: widgetWithIcon                                           *
  // ***************************************************************************
  // Looks for widgets that contain an Icon descendant displaying
  // IconData icon in it.
  testWidgets('finds a Button with Icon arrow_forward',
          (WidgetTester tester) async {
    await tester.pumpWidget(WidgetWithIcon());

    // You can find and tap on it like this:
    await tester.tap(find.widgetWithIcon(FlatButton, Icons.arrow_forward));
    await tester.pump();

    // Find a widget that displays the text 'button pressed'.
    expect(find.text('button pressed'), findsOneWidget);
  });

  // ***************************************************************************
  // * CommonFinders: widgetWithText                                           *
  // ***************************************************************************
  // Looks for widgets that contain an Icon descendant displaying
  // IconData icon in it.
  testWidgets('finds a Button with text "Click me!"',
          (WidgetTester tester) async {
        await tester.pumpWidget(WidgetWithIcon());

        // You can find and tap on it like this:
        await tester.tap(find.widgetWithText(FlatButton, "Click me!"));
        await tester.pump();

        // Find a widget that displays the text 'button pressed'.
        expect(find.text('button pressed'), findsOneWidget);
      });
}
