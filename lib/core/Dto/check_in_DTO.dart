class CategoryDTO {
  final num id;
  final String name;
  final bool isOrganisation;
  final String description;
  final num frequency;
  final String checkinUuid;
  final List<GoalDTO> goals;

  CategoryDTO({
    required this.id,
    required this.name,
    required this.isOrganisation,
    required this.description,
    required this.frequency,
    required this.checkinUuid,
    required this.goals,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'is_organisation': isOrganisation,
        'description': description,
        'frequency': frequency,
        'checkin_uuid': checkinUuid,
        'goals': goals.map((goal) => goal.toJson()).toList(),
      };
}

class GoalDTO {
  final num previousTarget;
  final String name;
  final String checkinMessage;
  final num unit;
  final num metric;
  final String uuid;
  num? target;
  String? description;
  num? order;

  final num expectedTarget;
  final String updatedAt;
  final num delta;

  GoalDTO({
    this.description,
    this.order,
    required this.previousTarget,
    required this.name,
    required this.checkinMessage,
    required this.unit,
    required this.metric,
    required this.uuid,
    required this.target,
    required this.expectedTarget,
    required this.updatedAt,
    required this.delta,
  });

  Map<String, dynamic> toJson() => {
        'previous_target': previousTarget,
        'name': name,
        'description': description,
        'order': order,
        'checkin_message': checkinMessage,
        'unit': unit,
        'metric': metric,
        'uuid': uuid,
        'target': target,
        'expected_target': expectedTarget,
        'updated_at': updatedAt,
        'delta': delta,
      };
}

class CheckinDTO {
  final List<CategoryDTO> categories;
  final bool needCustomerAttention;
  final String remarks;
  final String lessonsLearned;
  final String bestPractices;
  final dynamic additionalFile;
  final String? startTime; // Add this field

  CheckinDTO({
    required this.categories,
    required this.needCustomerAttention,
    required this.remarks,
    required this.lessonsLearned,
    required this.bestPractices,
    required this.additionalFile,
    this.startTime, // Initialize this field in the constructor
  });

  Map<String, dynamic> toJson() => {
        'categories': categories.map((category) => category.toJson()).toList(),
        'need_customer_attention': needCustomerAttention,
        'remarks': remarks,
        'lessons_learned': lessonsLearned,
        'best_practices': bestPractices,
        'additional_file': additionalFile,
        'date': startTime, // Include the time field in the JSON object
      };
}
