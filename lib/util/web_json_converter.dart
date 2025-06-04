// web_json_converter.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';

class WebJsonConverter {
  static Map<String, dynamic> toMap(dynamic json) {
    if (json == null) return {};
    if (json is Map<String, dynamic>) return json;
    
    if (kIsWeb) {
      try {
        // Handle JS-interop objects
        return jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
      } catch (e) {
        debugPrint('Web JSON conversion error: $e');
        return {};
      }
    }
    
    return Map<String, dynamic>.from(json);
  }

  static List<T> toList<T>(dynamic json, T Function(dynamic) converter) {
    if (json == null) return [];
    if (json is List) return json.map(converter).toList();
    return [];
  }
}