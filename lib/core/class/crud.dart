import 'dart:convert';
import 'dart:io';
import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

//String _basicAuth =
// 'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';

//Map<String, String> _myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(
        Uri.parse(linkurl),
        body: data,
      );
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("Post", uri);
    //  request.headers.addAll(_myheaders);
    if (image != null) {
      var lengeth = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, lengeth,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }
    data.forEach((key, Value) {
      request.fields[key] = Value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
