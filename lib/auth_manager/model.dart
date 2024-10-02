// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Info info;
  List<WelcomeItem> item;
  Auth auth;
  List<Event> event;
  List<Variable> variable;

  Welcome({
    required this.info,
    required this.item,
    required this.auth,
    required this.event,
    required this.variable,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    info: Info.fromJson(json["info"]),
    item: List<WelcomeItem>.from(json["item"].map((x) => WelcomeItem.fromJson(x))),
    auth: Auth.fromJson(json["auth"]),
    event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
    variable: List<Variable>.from(json["variable"].map((x) => Variable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
    "auth": auth.toJson(),
    "event": List<dynamic>.from(event.map((x) => x.toJson())),
    "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
  };
}

class Auth {
  String type;
  List<Variable> bearer;

  Auth({
    required this.type,
    required this.bearer,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    type: json["type"],
    bearer: List<Variable>.from(json["bearer"].map((x) => Variable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "bearer": List<dynamic>.from(bearer.map((x) => x.toJson())),
  };
}

class Variable {
  String key;
  String value;
  VariableType type;
  String? description;

  Variable({
    required this.key,
    required this.value,
    required this.type,
    this.description,
  });

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
    key: json["key"],
    value: json["value"],
    type: variableTypeValues.map[json["type"]]!,
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "type": variableTypeValues.reverse[type],
    "description": description,
  };
}

enum VariableType {
  STRING,
  TEXT
}

final variableTypeValues = EnumValues({
  "string": VariableType.STRING,
  "text": VariableType.TEXT
});

class Event {
  String listen;
  Script script;

  Event({
    required this.listen,
    required this.script,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    listen: json["listen"],
    script: Script.fromJson(json["script"]),
  );

  Map<String, dynamic> toJson() => {
    "listen": listen,
    "script": script.toJson(),
  };
}

class Script {
  String type;
  Packages? packages;
  List<String> exec;

  Script({
    required this.type,
    this.packages,
    required this.exec,
  });

  factory Script.fromJson(Map<String, dynamic> json) => Script(
    type: json["type"],
    packages: json["packages"] == null ? null : Packages.fromJson(json["packages"]),
    exec: List<String>.from(json["exec"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "packages": packages?.toJson(),
    "exec": List<dynamic>.from(exec.map((x) => x)),
  };
}

class Packages {
  Packages();

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Info {
  String postmanId;
  String name;
  String schema;
  String exporterId;

  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
    required this.exporterId,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    postmanId: json["_postman_id"],
    name: json["name"],
    schema: json["schema"],
    exporterId: json["_exporter_id"],
  );

  Map<String, dynamic> toJson() => {
    "_postman_id": postmanId,
    "name": name,
    "schema": schema,
    "_exporter_id": exporterId,
  };
}

class WelcomeItem {
  String name;
  List<ItemItem>? item;
  FluffyRequest? request;
  List<FluffyResponse>? response;
  List<Event>? event;

  WelcomeItem({
    required this.name,
    this.item,
    this.request,
    this.response,
    this.event,
  });

  factory WelcomeItem.fromJson(Map<String, dynamic> json) => WelcomeItem(
    name: json["name"],
    item: json["item"] == null ? [] : List<ItemItem>.from(json["item"]!.map((x) => ItemItem.fromJson(x))),
    request: json["request"] == null ? null : FluffyRequest.fromJson(json["request"]),
    response: json["response"] == null ? [] : List<FluffyResponse>.from(json["response"]!.map((x) => FluffyResponse.fromJson(x))),
    event: json["event"] == null ? [] : List<Event>.from(json["event"]!.map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "item": item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
    "request": request?.toJson(),
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    "event": event == null ? [] : List<dynamic>.from(event!.map((x) => x.toJson())),
  };
}

class ItemItem {
  String name;
  PurpleRequest request;
  List<PurpleResponse> response;
  List<Event>? event;

  ItemItem({
    required this.name,
    required this.request,
    required this.response,
    this.event,
  });

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
    name: json["name"],
    request: PurpleRequest.fromJson(json["request"]),
    response: List<PurpleResponse>.from(json["response"].map((x) => PurpleResponse.fromJson(x))),
    event: json["event"] == null ? [] : List<Event>.from(json["event"]!.map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "request": request.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "event": event == null ? [] : List<dynamic>.from(event!.map((x) => x.toJson())),
  };
}

class PurpleRequest {
  String method;
  List<dynamic> header;
  PurpleBody? body;
  Url url;

  PurpleRequest({
    required this.method,
    required this.header,
    this.body,
    required this.url,
  });

  factory PurpleRequest.fromJson(Map<String, dynamic> json) => PurpleRequest(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: json["body"] == null ? null : PurpleBody.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "body": body?.toJson(),
    "url": url.toJson(),
  };
}

class PurpleBody {
  String mode;
  List<Formdatum>? formdata;
  List<Variable>? urlencoded;

  PurpleBody({
    required this.mode,
    this.formdata,
    this.urlencoded,
  });

  factory PurpleBody.fromJson(Map<String, dynamic> json) => PurpleBody(
    mode: json["mode"],
    formdata: json["formdata"] == null ? [] : List<Formdatum>.from(json["formdata"]!.map((x) => Formdatum.fromJson(x))),
    urlencoded: json["urlencoded"] == null ? [] : List<Variable>.from(json["urlencoded"]!.map((x) => Variable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "formdata": formdata == null ? [] : List<dynamic>.from(formdata!.map((x) => x.toJson())),
    "urlencoded": urlencoded == null ? [] : List<dynamic>.from(urlencoded!.map((x) => x.toJson())),
  };
}

class Formdatum {
  String key;
  String? value;
  FormdatumType type;
  bool? disabled;
  String? src;
  String? description;

  Formdatum({
    required this.key,
    this.value,
    required this.type,
    this.disabled,
    this.src,
    this.description,
  });

  factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
    key: json["key"],
    value: json["value"],
    type: formdatumTypeValues.map[json["type"]]!,
    disabled: json["disabled"],
    src: json["src"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "type": formdatumTypeValues.reverse[type],
    "disabled": disabled,
    "src": src,
    "description": description,
  };
}

enum FormdatumType {
  FILE,
  TEXT
}

final formdatumTypeValues = EnumValues({
  "file": FormdatumType.FILE,
  "text": FormdatumType.TEXT
});

class Url {
  String raw;
  List<Host> host;
  List<String> path;
  List<Header>? variable;

  Url({
    required this.raw,
    required this.host,
    required this.path,
    this.variable,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    raw: json["raw"],
    host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
    path: List<String>.from(json["path"].map((x) => x)),
    variable: json["variable"] == null ? [] : List<Header>.from(json["variable"]!.map((x) => Header.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
    "path": List<dynamic>.from(path.map((x) => x)),
    "variable": variable == null ? [] : List<dynamic>.from(variable!.map((x) => x.toJson())),
  };
}

enum Host {
  API,
  BASE
}

final hostValues = EnumValues({
  "{{api}}": Host.API,
  "{{base}}": Host.BASE
});

class Header {
  String key;
  String value;

  Header({
    required this.key,
    required this.value,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

class PurpleResponse {
  String name;
  PurpleOriginalRequest originalRequest;
  String status;
  int code;
  String postmanPreviewlanguage;
  List<Header> header;
  List<dynamic> cookie;
  String body;

  PurpleResponse({
    required this.name,
    required this.originalRequest,
    required this.status,
    required this.code,
    required this.postmanPreviewlanguage,
    required this.header,
    required this.cookie,
    required this.body,
  });

  factory PurpleResponse.fromJson(Map<String, dynamic> json) => PurpleResponse(
    name: json["name"],
    originalRequest: PurpleOriginalRequest.fromJson(json["originalRequest"]),
    status: json["status"],
    code: json["code"],
    postmanPreviewlanguage: json["_postman_previewlanguage"],
    header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
    cookie: List<dynamic>.from(json["cookie"].map((x) => x)),
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "originalRequest": originalRequest.toJson(),
    "status": status,
    "code": code,
    "_postman_previewlanguage": postmanPreviewlanguage,
    "header": List<dynamic>.from(header.map((x) => x.toJson())),
    "cookie": List<dynamic>.from(cookie.map((x) => x)),
    "body": body,
  };
}

class PurpleOriginalRequest {
  String method;
  List<dynamic> header;
  FluffyBody? body;
  Url url;

  PurpleOriginalRequest({
    required this.method,
    required this.header,
    this.body,
    required this.url,
  });

  factory PurpleOriginalRequest.fromJson(Map<String, dynamic> json) => PurpleOriginalRequest(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: json["body"] == null ? null : FluffyBody.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "body": body?.toJson(),
    "url": url.toJson(),
  };
}

class FluffyBody {
  String mode;
  List<Formdatum>? formdata;
  List<Formdatum>? urlencoded;

  FluffyBody({
    required this.mode,
    this.formdata,
    this.urlencoded,
  });

  factory FluffyBody.fromJson(Map<String, dynamic> json) => FluffyBody(
    mode: json["mode"],
    formdata: json["formdata"] == null ? [] : List<Formdatum>.from(json["formdata"]!.map((x) => Formdatum.fromJson(x))),
    urlencoded: json["urlencoded"] == null ? [] : List<Formdatum>.from(json["urlencoded"]!.map((x) => Formdatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "formdata": formdata == null ? [] : List<dynamic>.from(formdata!.map((x) => x.toJson())),
    "urlencoded": urlencoded == null ? [] : List<dynamic>.from(urlencoded!.map((x) => x.toJson())),
  };
}

class FluffyRequest {
  Auth? auth;
  String method;
  List<Variable> header;
  TentacledBody body;
  Url url;

  FluffyRequest({
    this.auth,
    required this.method,
    required this.header,
    required this.body,
    required this.url,
  });

  factory FluffyRequest.fromJson(Map<String, dynamic> json) => FluffyRequest(
    auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
    method: json["method"],
    header: List<Variable>.from(json["header"].map((x) => Variable.fromJson(x))),
    body: TentacledBody.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "auth": auth?.toJson(),
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x.toJson())),
    "body": body.toJson(),
    "url": url.toJson(),
  };
}

class TentacledBody {
  String mode;
  String? raw;
  Options? options;
  List<Formdatum>? formdata;

  TentacledBody({
    required this.mode,
    this.raw,
    this.options,
    this.formdata,
  });

  factory TentacledBody.fromJson(Map<String, dynamic> json) => TentacledBody(
    mode: json["mode"],
    raw: json["raw"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
    formdata: json["formdata"] == null ? [] : List<Formdatum>.from(json["formdata"]!.map((x) => Formdatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "raw": raw,
    "options": options?.toJson(),
    "formdata": formdata == null ? [] : List<dynamic>.from(formdata!.map((x) => x.toJson())),
  };
}

class Options {
  Raw raw;

  Options({
    required this.raw,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    raw: Raw.fromJson(json["raw"]),
  );

  Map<String, dynamic> toJson() => {
    "raw": raw.toJson(),
  };
}

class Raw {
  String language;

  Raw({
    required this.language,
  });

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
  };
}

class FluffyResponse {
  String name;
  FluffyOriginalRequest originalRequest;
  String status;
  int code;
  String postmanPreviewlanguage;
  List<Header> header;
  List<dynamic> cookie;
  String body;

  FluffyResponse({
    required this.name,
    required this.originalRequest,
    required this.status,
    required this.code,
    required this.postmanPreviewlanguage,
    required this.header,
    required this.cookie,
    required this.body,
  });

  factory FluffyResponse.fromJson(Map<String, dynamic> json) => FluffyResponse(
    name: json["name"],
    originalRequest: FluffyOriginalRequest.fromJson(json["originalRequest"]),
    status: json["status"],
    code: json["code"],
    postmanPreviewlanguage: json["_postman_previewlanguage"],
    header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
    cookie: List<dynamic>.from(json["cookie"].map((x) => x)),
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "originalRequest": originalRequest.toJson(),
    "status": status,
    "code": code,
    "_postman_previewlanguage": postmanPreviewlanguage,
    "header": List<dynamic>.from(header.map((x) => x.toJson())),
    "cookie": List<dynamic>.from(cookie.map((x) => x)),
    "body": body,
  };
}

class FluffyOriginalRequest {
  String method;
  List<dynamic> header;
  TentacledBody body;
  Url url;

  FluffyOriginalRequest({
    required this.method,
    required this.header,
    required this.body,
    required this.url,
  });

  factory FluffyOriginalRequest.fromJson(Map<String, dynamic> json) => FluffyOriginalRequest(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: TentacledBody.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "body": body.toJson(),
    "url": url.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
