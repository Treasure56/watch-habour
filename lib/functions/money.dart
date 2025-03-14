class Money {
  static String format(double amount) {
    // Convert the amount to a string with 2 decimal places
    String formattedAmount = amount.toStringAsFixed(2);

    // Split the formatted string to separate integer and decimal parts
    List<String> parts = formattedAmount.split('.');

    // Add commas to the integer part
    String integerPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');

    // Concatenate integer and decimal parts with a dot
    return '\$$integerPart.${parts[1]}';
  }
}
