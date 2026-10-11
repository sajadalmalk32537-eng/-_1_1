import 'package:flutter/material.dart';

void main() {
  runApp(const TamaneenaApp());
}

class TamaneenaApp extends StatelessWidget {
  const TamaneenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'طمأنينة',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Cairo', // تأكد من توفر الخط أو سيستخدم الافتراضي
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> sections = const [
    {'title': 'القرآن الكريم', 'icon': Icons.menu_book},
    {'title': 'الأدعية المباركة', 'icon': Icons.auto_stories},
    {'title': 'المناجاة', 'icon': Icons.favorite},
    {'title': 'الزيارات', 'icon': Icons.location_city},
    {'title': 'الأذكار والتعقيبات', 'icon': Icons.wb_sunny},
    {'title': 'المسبحة الإلكترونية', 'icon': Icons.radio_button_checked},
    {'title': 'صلاة الليل', 'icon': Icons.nightlight_round},
    {'title': 'سيرة أهل البيت (ع)', 'icon': Icons.history_edu},
    {'title': 'فضائل أهل البيت (للشباب)', 'icon': Icons.star},
    {'title': 'أعمال اليوم والشهر', 'icon': Icons.calendar_month},
    {'title': 'شبهات وإجابات', 'icon': Icons.question_answer},
    {'title': 'مُجيب ذكي (مسائل فقهية)', 'icon': Icons.psychology},
    {'title': 'اتجاه القبلة', 'icon': Icons.explore},
    {'title': 'تقويم المناسبات', 'icon': Icons.event},
    {'title': 'المفضلة', 'icon': Icons.bookmark},
    {'title': 'مساحة الشباب', 'icon': Icons.sports_esports},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        title: const Text(
          'تطبيق طمأنينة',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر العلوي: آية الطمأنينة الثابتة
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    '﴿ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ ﴾',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'مرحباً بك في رحاب السكينة والذكر الحكيم',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            // شبكة الأقسام والخدمات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sections.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عمودين في كل صف
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // هنا سيتم توجيه المستخدم للقسم لاحقاً
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم النقر على: ${sections[index]['title']}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.withOpacity(0.15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            sections[index]['icon'],
                            size: 32,
                            color: const Color(0xFF1E3A8A),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              sections[index]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
