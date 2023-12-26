enum ServicePath {
  characterPage('character?page='),
  characterName('character?name='),
  episode('episode?page='),
  location('location?page=');

  final String value;
  const ServicePath(this.value);
}
