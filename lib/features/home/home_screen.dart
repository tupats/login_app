import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/common/models/user_model.dart';
import 'package:login_app/utils/extensions/context.dart';
import 'package:login_app/utils/text_styles.dart';
import 'package:login_app/features/common/widgets/app_bar.dart';

import '../auth/cubit/auth_cubit.dart';
import 'info_tile.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '',
        onBackPressed: () => context.read<AuthCubit>().logout(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 62,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
            const SizedBox(height: 20),
            Text(
              user.username,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    'New York',
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 5,
                  width: 5,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text('ID: ${user.id}'),
                ),
              ],
            ),
            const SizedBox(height: 17),
            TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style: AppTextStyles.underline(context),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('About Me'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      child: const Text('Log Out'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                //fills empty space on the bottom for larger screen sizes
                Positioned(
                  bottom: -MediaQuery.sizeOf(context).height,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: const Color(0xFF525464),
                    height: MediaQuery.sizeOf(context).height,
                  ),
                ),
                Container(
                  color: const Color(0xFF525464),
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      InfoTile(
                        title: 'Phone number',
                        subtitle: user.phoneNumber,
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 16),
                      InfoTile(
                        title: 'Email',
                        subtitle: user.email,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      InfoTile(
                        title: 'Completed projects',
                        subtitle: user.completedProjects.toString(),
                        icon: Icons.circle,
                        titleStyle: context.textTheme.labelMedium?.copyWith(
                          color: Colors.white.withOpacity(0.66),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
