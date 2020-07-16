class OCRModel {
  List<Responses> responses;

  OCRModel({this.responses});

  OCRModel.fromJson(Map<String, dynamic> json) {
    if (json['responses'] != null) {
      responses = new List<Responses>();
      json['responses'].forEach((v) {
        responses.add(new Responses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responses != null) {
      data['responses'] = this.responses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Responses {
  List<TextAnnotations> textAnnotations;
  FullTextAnnotation fullTextAnnotation;

  Responses({this.textAnnotations, this.fullTextAnnotation});

  Responses.fromJson(Map<String, dynamic> json) {
    if (json['textAnnotations'] != null) {
      textAnnotations = new List<TextAnnotations>();
      json['textAnnotations'].forEach((v) {
        textAnnotations.add(new TextAnnotations.fromJson(v));
      });
    }
    fullTextAnnotation = json['fullTextAnnotation'] != null
        ? new FullTextAnnotation.fromJson(json['fullTextAnnotation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.textAnnotations != null) {
      data['textAnnotations'] =
          this.textAnnotations.map((v) => v.toJson()).toList();
    }
    if (this.fullTextAnnotation != null) {
      data['fullTextAnnotation'] = this.fullTextAnnotation.toJson();
    }
    return data;
  }
}

class TextAnnotations {
  String locale;
  String description;
  BoundingPoly boundingPoly;

  TextAnnotations({this.locale, this.description, this.boundingPoly});

  TextAnnotations.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    description = json['description'];
    boundingPoly = json['boundingPoly'] != null
        ? new BoundingPoly.fromJson(json['boundingPoly'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['description'] = this.description;
    if (this.boundingPoly != null) {
      data['boundingPoly'] = this.boundingPoly.toJson();
    }
    return data;
  }
}

class BoundingPoly {
  List<Vertices> vertices;

  BoundingPoly({this.vertices});

  BoundingPoly.fromJson(Map<String, dynamic> json) {
    if (json['vertices'] != null) {
      vertices = new List<Vertices>();
      json['vertices'].forEach((v) {
        vertices.add(new Vertices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vertices != null) {
      data['vertices'] = this.vertices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vertices {
  int x;
  int y;

  Vertices({this.x, this.y});

  Vertices.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class FullTextAnnotation {
  List<Pages> pages;
  String text;

  FullTextAnnotation({this.pages, this.text});

  FullTextAnnotation.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = new List<Pages>();
      json['pages'].forEach((v) {
        pages.add(new Pages.fromJson(v));
      });
    }
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    return data;
  }
}

class Pages {
  Property property;
  int width;
  int height;
  List<Blocks> blocks;

  Pages({this.property, this.width, this.height, this.blocks});

  Pages.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    width = json['width'];
    height = json['height'];
    if (json['blocks'] != null) {
      blocks = new List<Blocks>();
      json['blocks'].forEach((v) {
        blocks.add(new Blocks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.blocks != null) {
      data['blocks'] = this.blocks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Property {
  List<DetectedLanguages> detectedLanguages;

  Property({this.detectedLanguages});

  Property.fromJson(Map<String, dynamic> json) {
    if (json['detectedLanguages'] != null) {
      detectedLanguages = new List<DetectedLanguages>();
      json['detectedLanguages'].forEach((v) {
        detectedLanguages.add(new DetectedLanguages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detectedLanguages != null) {
      data['detectedLanguages'] =
          this.detectedLanguages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetectedLanguages {
  String languageCode;
  var confidence;

  DetectedLanguages({this.languageCode, this.confidence});

  DetectedLanguages.fromJson(Map<String, dynamic> json) {
    languageCode = json['languageCode'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['languageCode'] = this.languageCode;
    data['confidence'] = this.confidence;
    return data;
  }
}

class Blocks {
  Property property;
  BoundingPoly boundingBox;
  List<Paragraphs> paragraphs;
  String blockType;

  Blocks({this.property, this.boundingBox, this.paragraphs, this.blockType});

  Blocks.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    boundingBox = json['boundingBox'] != null
        ? new BoundingPoly.fromJson(json['boundingBox'])
        : null;
    if (json['paragraphs'] != null) {
      paragraphs = new List<Paragraphs>();
      json['paragraphs'].forEach((v) {
        paragraphs.add(new Paragraphs.fromJson(v));
      });
    }
    blockType = json['blockType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    if (this.boundingBox != null) {
      data['boundingBox'] = this.boundingBox.toJson();
    }
    if (this.paragraphs != null) {
      data['paragraphs'] = this.paragraphs.map((v) => v.toJson()).toList();
    }
    data['blockType'] = this.blockType;
    return data;
  }
}

class Paragraphs {
  Property property;
  BoundingPoly boundingBox;
  List<Words> words;

  Paragraphs({this.property, this.boundingBox, this.words});

  Paragraphs.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    boundingBox = json['boundingBox'] != null
        ? new BoundingPoly.fromJson(json['boundingBox'])
        : null;
    if (json['words'] != null) {
      words = new List<Words>();
      json['words'].forEach((v) {
        words.add(new Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    if (this.boundingBox != null) {
      data['boundingBox'] = this.boundingBox.toJson();
    }
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  Property property;
  BoundingPoly boundingBox;
  List<Symbols> symbols;

  Words({this.property, this.boundingBox, this.symbols});

  Words.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    boundingBox = json['boundingBox'] != null
        ? new BoundingPoly.fromJson(json['boundingBox'])
        : null;
    if (json['symbols'] != null) {
      symbols = new List<Symbols>();
      json['symbols'].forEach((v) {
        symbols.add(new Symbols.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    if (this.boundingBox != null) {
      data['boundingBox'] = this.boundingBox.toJson();
    }
    if (this.symbols != null) {
      data['symbols'] = this.symbols.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Symbols {
  Property property;
  BoundingPoly boundingBox;
  String text;

  Symbols({this.property, this.boundingBox, this.text});

  Symbols.fromJson(Map<String, dynamic> json) {
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    boundingBox = json['boundingBox'] != null
        ? new BoundingPoly.fromJson(json['boundingBox'])
        : null;
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.property != null) {
      data['property'] = this.property.toJson();
    }
    if (this.boundingBox != null) {
      data['boundingBox'] = this.boundingBox.toJson();
    }
    data['text'] = this.text;
    return data;
  }
}


class DetectedBreak {
  String type;

  DetectedBreak({this.type});

  DetectedBreak.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}