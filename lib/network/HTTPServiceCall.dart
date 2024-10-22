import 'package:getrestapicalldemo/models/Photos.dart';
import 'package:getrestapicalldemo/models/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPServiceCall {

  final String GET_URL = "https://jsonplaceholder.typicode.com/";

  Future<List<Post>> getPostDataInformation() async {

    List<Post> postListData = [];

    final response = await http.get(Uri.parse("${GET_URL}posts") );

    var jsonResponseData = json.decode(response.body);

    for (var postData in jsonResponseData) {

      Post post = Post(id: postData['id'], userId: postData['userId'], title: postData['title'], body: postData['body']);

      postListData.add(post);

    }
    return postListData;
  }


  Future<List<Photos>> getImageDataInformation() async {

    List<Photos> photosListData = [];

    final response = await http.get(Uri.parse("${GET_URL}photos") );

    var jsonResponseData = json.decode(response.body);

    for (var photosData in jsonResponseData) {

      Photos photos = Photos(id: photosData['id'], albumId: photosData['albumId'], title: photosData['title'], url: photosData['url'], thumbnailUrl: photosData['thumbnailUrl']);

      photosListData.add(photos);

    }
    return photosListData;
  }
}