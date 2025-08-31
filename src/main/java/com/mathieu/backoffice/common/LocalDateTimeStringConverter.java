package com.mathieu.backoffice.common;

import java.time.LocalDateTime;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class LocalDateTimeStringConverter implements AttributeConverter<LocalDateTime, String> {

  @Override
  public String convertToDatabaseColumn(LocalDateTime attribute) {
    return attribute == null ? null : attribute.toString(); // ISO-8601 ex: 2025-08-25T21:37:45.123
  }

  @Override
  public LocalDateTime convertToEntityAttribute(String dbData) {
    return dbData == null ? null : LocalDateTime.parse(dbData);
  }
}
