import 'package:flutter/material.dart';
import 'package:mobileshop/features/home/presentation/widgets/drop_down_list.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 30,
        ),
        Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: Color(0xFFFF6E4E),
            ),
            SizedBox(
              width: 11,
            ),
            Text(
              'Zihuatanejo, Gro',
              style: TextStyle(
                  color: Color(0xFF010035),
                  fontSize: 15,
                  fontFamily: 'Mark Pro',
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.expand_more,
              color: Color(0xFFB3B3B3),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.filter_list,
            color: Color(0xFF010035),
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                context: context,
                builder: (context) => Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF010035),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ),
                                  const Text(
                                    'Filter options',
                                    style: TextStyle(
                                        color: Color(0xFF010035),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mark Pro'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Done'),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xFFFF6E4E))),
                                  )
                                ],
                              ),
                            ),
                            const Text(
                              'Brand',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
                            ),
                            DropDownList(
                              listItems: [
                                'Samsung',
                                'Xiaomi',
                                'Iphone',
                                'Motorolla'
                              ],
                              selectedItem: 'Samsung',
                            ),
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
                            ),
                            DropDownList(
                              listItems: [
                                '\$300 - \$500',
                                '\$500 - \$1000',
                                '\$1000 - \$3000',
                                '\$3000 - \$5000',
                                '\$5000 - \$7000',
                                '\$7000 - \$10000',
                              ],
                              selectedItem: '\$300 - \$500',
                            ),
                            const Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mark Pro'),
                            ),
                            DropDownList(
                              listItems: [
                                '4.5 to 5.5 inches',
                                '5.5 to 6.2 inches',
                                '6.2 to 6.5 inches',
                              ],
                              selectedItem: '4.5 to 5.5 inches',
                            ),
                          ],
                        ),
                      ),
                      height: 400,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                    ));
          },
        ),
      ],
    );
  }
}
