class Pagination{

  String next_page_url;

  Pagination.fromJson(Map<String, dynamic> json)
      :
        next_page_url = json["next_page_url"] == null ? "" : json["next_page_url"];
}