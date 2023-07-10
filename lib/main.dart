import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('en'),
        Locale('es'),
        Locale('he'),
        Locale('ru'),
        Locale('fr', 'BE'),
        Locale('fr', 'CA'),
        Locale('ja'),
        Locale('de'),
        Locale('hi'),
        Locale('ar'),
      ],
      locale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children: <Widget>[


         CustomButtonWidget(
           label: 'AGENDAR',
           icon: Icons.calendar_month,
           onTap: () async {
             //   Navigator.pop(context);
             
    
             DateTime? newdate = await showDatePicker(
          
                 context: context,
                 initialDate: DateTime.now(),
                 firstDate: DateTime.now(),
                 lastDate: DateTime(2200));
             //setState
             // date = newdate!;
           },
         ),
          ],
        ),
      ),

    );
  }
}



class CustomButtonWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onTap;
  const CustomButtonWidget(
      {super.key, required this.label, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: onTap,
         overlayColor: MaterialStatePropertyAll(Colors.pink.withOpacity(0.5)),
          child: SizedBox(
            width: 70,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 35,
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.amber),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
