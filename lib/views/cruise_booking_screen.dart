import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final dest = viewModel.destination;

    final details = <Widget>[
      TitleSectionWidget(
        name: dest.name,
        location: dest.location,
        rating: viewModel.rating,
        isFavorited: viewModel.isFavorited,
        onStarTap: viewModel.toggleRating,
      ),
      const Divider(height: 1),
      const ActionBarWidget(),
      const Divider(height: 1),
      DescriptionWidget(text: dest.description),
      BookingControlsWidget(viewModel: viewModel),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sibu River Cruise & Heritage')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Row(
              children: [
                Expanded(
                  child: HeaderImageWidget(
                    imageAsset: dest.imageAsset,
                    caption: dest.imageCaption,
                  ),
                ),
                Expanded(child: ListView(children: details)),
              ],
            );
          }
          return ListView(
            children: [
              HeaderImageWidget(
                imageAsset: dest.imageAsset,
                caption: dest.imageCaption,
                height: 240,
              ),
              ...details,
            ],
          );
        },
      ),
    );
  }
}