describe('The Jungle Application, product details', () => {
  it( 'should visit home', () => {
    cy.visit('/')  
  }) 
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("can visit one of the products", () => {
    cy.get(".products article:first").click();
  });
})