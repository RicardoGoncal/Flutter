import 'package:cookapp/models/users.dart';
import 'package:cookapp/provider/provider.dart';
import 'package:cookapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final Receita receita;
  const UserTile(this.receita);

  @override
  Widget build(BuildContext context) {
    final avatar = receita.imagemReceita == null ||
            receita.imagemReceita.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(receita.imagemReceita));
    return ListTile(
      leading: avatar,
      title: Text(receita.nomeReceita),
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.CADASTRO,
        );
      },
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.RECEITA_FORM,
                  arguments: receita,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir receita'),
                    content: Text('Tem certeza??'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ),
                ).then((confirma) {
                  if (confirma) {
                    Provider.of<UserProvider>(context, listen: false)
                        .remove(receita);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
