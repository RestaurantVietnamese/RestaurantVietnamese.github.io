import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_state.dart';
import 'package:restaurant_with_frog_api/page/table/widget/draggable_table_item.dart';

class CanvasArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        final content = Stack(
          children: state.tables.map((table) {
            return Positioned(
              left: table.position.dx,
              top: table.position.dy,
              child: DraggableTableItem(
                table: table,
                isSelected: state.selectedTableIds.contains(table.id),
              ),
            );
          }).toList(),
        );

        // 👇 Nếu không phải web, dùng InteractiveViewer
        if (!kIsWeb) {
          return InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(200),
            minScale: 0.5,
            maxScale: 3.0,
            child: content,
          );
        }

        // 👇 Còn nếu là web, bỏ qua InteractiveViewer
        return content;
      },
    );
  }
}

