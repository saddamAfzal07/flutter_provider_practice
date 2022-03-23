import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/controller/votinglist.dart';
import 'package:provider/provider.dart';

class VotingList extends StatefulWidget {
  const VotingList({Key? key}) : super(key: key);

  @override
  State<VotingList> createState() => _VotingListState();
}

class _VotingListState extends State<VotingList> {
  TextEditingController valueadd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Votingdetlist>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voting List "),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter  Name"),
            controller: valueadd,
          ),
          ElevatedButton(
              onPressed: () {
                if (valueadd.text.isNotEmpty) {
                  state.addItem(valueadd.text);
                }
              },
              child: const Text("Submit")),
          Consumer<Votingdetlist>(
            builder: (context, value, _) => Expanded(
              child: ListView.builder(
                itemCount: value.getdata.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        value.removeName(index);
                        // value.incrementvote(index);
                      },
                      onLongPress: () {
                        // state.removeName(index);
                      },
                      title: Text(value.getdata[index]["title"]),
                      trailing: CircleAvatar(
                        child: Text("${value.getdata[index]["votes"]}"),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
