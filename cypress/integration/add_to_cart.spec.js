describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("should increase item by one after user clicks on 'Add to Cart' for a product", () => {
    cy.get(".products")
      .should("be.visible")
      .find("article:first")
      .contains("Add")
      .click({force: true});
    cy.get(".nav-link").contains("My Cart (1)");
  });
});