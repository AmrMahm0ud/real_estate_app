import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 20.0,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.red),
                width: 140,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "ahmed".toUpperCase(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "165000" + " AED",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          width: 100,
                          child: Text(
                            "al raha beach-Al Muneera-AI",
                            maxLines: 2,
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Icon(Icons.king_bed_outlined),
                          ),
                          Text(
                            "1",
                            style: TextStyle(fontSize: 11.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Icon(Icons.bathtub_outlined),
                          ),
                          Text(
                            "2",
                            style: TextStyle(fontSize: 11.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Icon(Icons.apartment),
                          ),
                          Text(
                            "2340.0" + "sqft",
                            style: TextStyle(fontSize: 11.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
